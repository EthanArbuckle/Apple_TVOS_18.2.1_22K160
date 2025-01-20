@interface PBUIDebugRootViewController
+ (BOOL)_showExternalControlDebug;
+ (BOOL)_showUIDebug;
- (BSAtomicSignal)invalidationSignal;
- (FBScene)trackedCurrentApplicationScene;
- (PBUIDebugRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_updateExternalControlInfo;
- (void)_updateLayoutLevelsInfo;
- (void)_updateSceneInfo;
- (void)_updateVisibility;
- (void)_updateVisibilityAndContent;
- (void)dealloc;
- (void)invalidate;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4;
- (void)systemGestureManager:(id)a3 didActivateHandleOfSystemGesture:(unint64_t)a4;
- (void)systemGestureManager:(id)a3 didInvokeHandleOfSystemGesture:(unint64_t)a4;
- (void)systemGestureManager:(id)a3 didInvokeHandleOfSystemGesture:(unint64_t)a4 deferringFrom:(unint64_t)a5;
- (void)viewDidLoad;
@end

@implementation PBUIDebugRootViewController

- (PBUIDebugRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBUIDebugRootViewController;
  v4 = -[PBUIDebugRootViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
    invalidationSignal = v4->_invalidationSignal;
    v4->_invalidationSignal = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 focusCoordinator]);

    [v8 addObserver:v4 forKeyPath:@"levelsToLayoutState" options:0 context:&off_1003DD308];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v9 addObserver:v4 forKeyPath:@"ShowUIDebug" options:0 context:&off_1003DD310];
    [v9 addObserver:v4 forKeyPath:@"ShowExternalControlDebug" options:0 context:&off_1003DD310];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v4 selector:"_updateSceneInfo" name:UIWindowDidBecomeKeyNotification object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v4 selector:"_updateExternalControlInfo" name:@"PBExternalControlPolicyDidUpdateNotification" object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v12 addObserver:v4];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentApplicationSceneHandle]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 sceneIfExists]);
    trackedCurrentApplicationScene = v4->_trackedCurrentApplicationScene;
    v4->_trackedCurrentApplicationScene = (FBScene *)v14;

    -[FBScene addObserver:](v4->_trackedCurrentApplicationScene, "addObserver:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    [v16 setDebugPublisher:v4];
  }

  return v4;
}

- (void)dealloc
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBUIDebugRootViewController;
    -[PBUIDebugRootViewController dealloc](&v5, "dealloc");
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance must be invalidated before being deallocated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293BF8(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

- (void)loadView
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBUIDebugContainerView);
  -[PBUIDebugRootViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBUIDebugRootViewController;
  -[PBUIDebugRootViewController viewDidLoad](&v3, "viewDidLoad");
  -[PBUIDebugRootViewController _updateVisibilityAndContent](self, "_updateVisibilityAndContent");
}

- (void)invalidate
{
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusCoordinator]);

    [v4 removeObserver:self forKeyPath:@"levelsToLayoutState"];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 removeObserver:self forKeyPath:@"ShowUIDebug"];
    [v5 removeObserver:self forKeyPath:@"ShowExternalControlDebug"];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v7 removeObserver:self];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    [v8 setDebugPublisher:0];

    -[FBScene removeObserver:](self->_trackedCurrentApplicationScene, "removeObserver:", self);
    trackedCurrentApplicationScene = self->_trackedCurrentApplicationScene;
    self->_trackedCurrentApplicationScene = 0LL;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController viewIfLoaded](self, "viewIfLoaded"));
    [v10 setHidden:1];
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_1003DD308)
  {
    -[PBUIDebugRootViewController _updateLayoutLevelsInfo](self, "_updateLayoutLevelsInfo");
  }

  else if (a6 == &off_1003DD310)
  {
    -[PBUIDebugRootViewController _updateVisibilityAndContent](self, "_updateVisibilityAndContent");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBUIDebugRootViewController;
    -[PBUIDebugRootViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4
{
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  v8 = (FBScene *)a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 currentApplicationSceneHandle]);
  id v11 = (FBScene *)objc_claimAutoreleasedReturnValue([v10 sceneIfExists]);

  trackedCurrentApplicationScene = self->_trackedCurrentApplicationScene;
  if (trackedCurrentApplicationScene != v11)
  {
    -[FBScene removeObserver:](trackedCurrentApplicationScene, "removeObserver:", self);
    objc_storeStrong((id *)&self->_trackedCurrentApplicationScene, v11);
    -[FBScene addObserver:](self->_trackedCurrentApplicationScene, "addObserver:", self);
  }

  if (v11 != v8) {
    -[FBScene removeObserver:](v8, "removeObserver:", self);
  }
  [v9 addObserver:self];
  -[PBUIDebugRootViewController _updateSceneInfo](self, "_updateSceneInfo");
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
}

- (void)systemGestureManager:(id)a3 didInvokeHandleOfSystemGesture:(unint64_t)a4
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemGestureStackView]);

  [v6 setLastInvokedSystemGesture:a4];
}

- (void)systemGestureManager:(id)a3 didInvokeHandleOfSystemGesture:(unint64_t)a4 deferringFrom:(unint64_t)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemGestureStackView]);

  [v8 setLastInvokedSystemGesture:a4 deferringFrom:a5];
}

- (void)systemGestureManager:(id)a3 didActivateHandleOfSystemGesture:(unint64_t)a4
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemGestureStackView]);

  [v6 setLastActivatedSystemGesture:a4];
}

- (void)_updateLayoutLevelsInfo
{
  if ([(id)objc_opt_class(self) _showUIDebug])
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusCoordinator]);

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 levelsToLayoutState]);
    id v6 = [v4 activeLayoutLevel];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layoutLevelsStackView]);

    [v8 setLayoutLevelStates:v5 activeLayoutLevel:v6];
  }

- (void)_updateSceneInfo
{
  if ([(id)objc_opt_class(self) _showUIDebug])
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeWindow]);

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedSceneHandle]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sceneIfExists]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBAttentionMonitor _activeApplicationScene]( &OBJC_CLASS___PBAttentionMonitor,  "_activeApplicationScene"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sceneStackView]);

    [v12 setActiveWindow:v4];
    [v12 setFocusedSceneHandle:v6];
    [v12 setCurrentApplicationScene:v9];
    [v12 setAttentionActiveApplicationScene:v10];
  }

- (void)_updateExternalControlInfo
{
  if ([(id)objc_opt_class(self) _showExternalControlDebug])
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  0LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  2LL));
    id v6 = [v4 transport];
    uint64_t v14 = v3;
    id v7 = [v3 isActiveSource];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 debugDescriptionShort]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 debugDescriptionShort]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 debugDescriptionShort]);
    id v11 = [v3 volumeButtonBehavior];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 externalControlStackView]);

    [v13 setPowerFeatureTransport:v6 isActiveSource:v7];
    [v13 setPowerDebugDescription:v8];
    [v13 setVolumeDebugDescription:v9];
    [v13 setMuteDebugDescription:v10];
    [v13 setVolumeButtonBehavior:v11];
  }

- (void)_updateVisibility
{
  if (-[PBUIDebugRootViewController isViewLoaded](self, "isViewLoaded"))
  {
    unsigned int v3 = [(id)objc_opt_class(self) _showUIDebug];
    uint64_t v4 = [(id)objc_opt_class(self) _showExternalControlDebug] ^ 1;
    uint64_t v5 = v3 ^ 1;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 externalControlStackView]);
    [v7 setHidden:v4];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layoutLevelsStackView]);
    [v9 setHidden:v5];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sceneStackView]);
    [v11 setHidden:v5];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugRootViewController view](self, "view"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 systemGestureStackView]);
    [v13 setHidden:v5];
  }

- (void)_updateVisibilityAndContent
{
}

+ (BOOL)_showUIDebug
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"ShowUIDebug"];

  return v3;
}

+ (BOOL)_showExternalControlDebug
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"ShowExternalControlDebug"];

  return v3;
}

- (BSAtomicSignal)invalidationSignal
{
  return self->_invalidationSignal;
}

- (FBScene)trackedCurrentApplicationScene
{
  return self->_trackedCurrentApplicationScene;
}

- (void).cxx_destruct
{
}

@end