@interface PBWaitForDefaultKioskSceneTransaction
- (BOOL)_canBeInterrupted;
- (BSWatchdog)watchdog;
- (FBScene)defaultKioskScene;
- (FBScene)readyDefaultKioskScene;
- (NSString)targetSceneIdentifier;
- (PBWaitForDefaultKioskSceneTransaction)init;
- (void)_begin;
- (void)_didComplete;
- (void)_stopObserving;
- (void)dealloc;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setDefaultKioskScene:(id)a3;
- (void)setTargetSceneIdentifier:(id)a3;
@end

@implementation PBWaitForDefaultKioskSceneTransaction

- (PBWaitForDefaultKioskSceneTransaction)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction;
  v2 = -[PBWaitForDefaultKioskSceneTransaction init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    [v3 addObserver:v2];

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_defaultKioskAppSceneIdentity]( &OBJC_CLASS___FBSSceneIdentity,  "pb_defaultKioskAppSceneIdentity"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 identifier]);
    targetSceneIdentifier = v2->_targetSceneIdentifier;
    v2->_targetSceneIdentifier = (NSString *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sceneWithIdentifier:v2->_targetSceneIdentifier]);
    defaultKioskScene = v2->_defaultKioskScene;
    v2->_defaultKioskScene = (FBScene *)v8;

    -[FBScene addObserver:](v2->_defaultKioskScene, "addObserver:", v2);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction;
  -[PBWaitForDefaultKioskSceneTransaction dealloc](&v3, "dealloc");
}

- (FBScene)readyDefaultKioskScene
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWaitForDefaultKioskSceneTransaction defaultKioskScene](self, "defaultKioskScene"));
  if ([v2 contentState] == (id)2) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = 0LL;
  }
  v4 = v3;

  return v4;
}

- (void)setDefaultKioskScene:(id)a3
{
  uint64_t v5 = (FBScene *)a3;
  defaultKioskScene = self->_defaultKioskScene;
  if (defaultKioskScene != v5)
  {
    -[FBScene removeObserver:](defaultKioskScene, "removeObserver:", self);
    if (v5) {
      -[FBScene addObserver:](v5, "addObserver:", self);
    }
    objc_storeStrong((id *)&self->_defaultKioskScene, a3);
  }
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction;
  -[PBWaitForDefaultKioskSceneTransaction _begin](&v14, "_begin");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBWaitForDefaultKioskSceneTransaction readyDefaultKioskScene](self, "readyDefaultKioskScene"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBWaitForDefaultKioskSceneTransaction queue](self, "queue"));
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    v10 = sub_100070B7C;
    objc_super v11 = &unk_1003D1228;
    objc_copyWeak(&v12, &location);
    v6 = -[BSWatchdog initWithTimeout:queue:completion:](v4, "initWithTimeout:queue:completion:", v5, &v8, 0.8);
    watchdog = self->_watchdog;
    self->_watchdog = v6;

    -[BSWatchdog start](self->_watchdog, "start", v8, v9, v10, v11);
    -[PBWaitForDefaultKioskSceneTransaction addMilestone:]( self,  "addMilestone:",  @"PBContentStateWaitingMilestone");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction;
  -[PBWaitForDefaultKioskSceneTransaction _didComplete](&v3, "_didComplete");
}

- (void)sceneContentStateDidChange:(id)a3
{
  if ([a3 contentState] == (id)2) {
    -[PBWaitForDefaultKioskSceneTransaction satisfyMilestone:]( self,  "satisfyMilestone:",  @"PBContentStateWaitingMilestone");
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v7 = [v6 isEqualToString:self->_targetSceneIdentifier];

  if (v7) {
    -[PBWaitForDefaultKioskSceneTransaction setDefaultKioskScene:](self, "setDefaultKioskScene:", v5);
  }
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  unsigned int v6 = [v5 isEqualToString:self->_targetSceneIdentifier];

  if (v6) {
    -[PBWaitForDefaultKioskSceneTransaction setDefaultKioskScene:](self, "setDefaultKioskScene:", 0LL);
  }
}

- (void)_stopObserving
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  [v3 removeObserver:self];

  -[FBScene removeObserver:](self->_defaultKioskScene, "removeObserver:", self);
}

- (NSString)targetSceneIdentifier
{
  return self->_targetSceneIdentifier;
}

- (void)setTargetSceneIdentifier:(id)a3
{
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (FBScene)defaultKioskScene
{
  return self->_defaultKioskScene;
}

- (void).cxx_destruct
{
}

@end