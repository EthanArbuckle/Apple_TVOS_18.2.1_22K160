@interface PBApplicationSceneViewController
- (BOOL)allowSnapshots;
- (BOOL)isEligibleForFocus;
- (BOOL)isReady;
- (BOOL)isWallpaperEnabled;
- (BOOL)preferLaunchImageSnapshot;
- (NSString)description;
- (NSString)identifier;
- (PBApplicationSceneView)sceneView;
- (PBApplicationSceneViewController)initWithSceneHandle:(id)a3 layoutLevel:(int64_t)a4;
- (PBSceneDeferralTargetAssertion)deferralTargetAssertion;
- (PBSceneHandle)sceneHandle;
- (id)preferredFocusEnvironments;
- (int64_t)layoutLevel;
- (unint64_t)effectivePresentationMode;
- (unint64_t)presentationMode;
- (void)_updateDeferralTargetAssertionIfNeeded;
- (void)applicationSceneView:(id)a3 didUpdateReadiness:(BOOL)a4;
- (void)applicationSceneView:(id)a3 willLoadSnapshotWithRequest:(id)a4;
- (void)applicationSceneViewDidUpdatePresentationMode:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setAllowSnapshots:(BOOL)a3;
- (void)setEligibleForFocus:(BOOL)a3;
- (void)setPreferLaunchImageSnapshot:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setPresentationMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setWallpaperEnabled:(BOOL)a3;
@end

@implementation PBApplicationSceneViewController

- (PBApplicationSceneViewController)initWithSceneHandle:(id)a3 layoutLevel:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBApplicationSceneViewController;
  v8 = -[PBApplicationSceneViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sceneHandle, a3);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 sceneIdentifier]);
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v9->_layoutLevel = a4;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBApplicationSceneViewController;
  -[PBApplicationSceneViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  objc_super v3 = -[PBApplicationSceneView initWithSceneHandle:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBApplicationSceneView),  "initWithSceneHandle:layoutLevel:",  self->_sceneHandle,  self->_layoutLevel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneView layer](v3, "layer"));
  [v4 setAllowsGroupOpacity:0];

  -[PBApplicationSceneView setDelegate:](v3, "setDelegate:", self);
  -[PBApplicationSceneViewController setView:](self, "setView:", v3);
}

- (PBApplicationSceneView)sceneView
{
  return (PBApplicationSceneView *)(id)objc_claimAutoreleasedReturnValue( -[PBApplicationSceneViewController view]( self,  "view"));
}

- (void)setPresentationMode:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  [v4 setPresentationMode:a3];
}

- (void)setPresentationMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  [v9 setPresentationMode:a3 animated:v5 completion:v8];
}

- (unint64_t)presentationMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  id v3 = [v2 presentationMode];

  return (unint64_t)v3;
}

- (unint64_t)effectivePresentationMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  id v3 = [v2 effectivePresentationMode];

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController identifier](self, "identifier"));
  id v5 = [v3 appendObject:v4 withName:@"identifier"];

  id v6 =  objc_msgSend( v3,  "appendInteger:withName:",  -[PBApplicationSceneViewController layoutLevel](self, "layoutLevel"),  @"layoutLevel");
  id v7 =  objc_msgSend( v3,  "appendInteger:withName:",  -[PBApplicationSceneViewController presentationMode](self, "presentationMode"),  @"presentationMode");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBApplicationSceneViewController;
  -[PBApplicationSceneViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[PBApplicationSceneViewController _updateDeferralTargetAssertionIfNeeded]( self,  "_updateDeferralTargetAssertionIfNeeded");
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self, "view"));
  objc_super v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)_updateDeferralTargetAssertionIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self, "view"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedItem]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self, "view"));

  deferralTargetAssertion = self->_deferralTargetAssertion;
  if (v6 != v7 || v3 == 0LL)
  {
    -[PBSceneDeferralTargetAssertion invalidate](deferralTargetAssertion, "invalidate");
    uint64_t v10 = 0LL;
LABEL_9:
    v11 = self->_deferralTargetAssertion;
    self->_deferralTargetAssertion = v10;

    goto LABEL_10;
  }

  if ((-[PBSceneDeferralTargetAssertion isValid](deferralTargetAssertion, "isValid") & 1) == 0)
  {
    uint64_t v10 = -[PBSceneDeferralTargetAssertion initWithSceneHandle:reason:]( objc_alloc(&OBJC_CLASS___PBSceneDeferralTargetAssertion),  "initWithSceneHandle:reason:",  self->_sceneHandle,  @"Focus Deferral");
    goto LABEL_9;
  }

- (void)setWallpaperEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  [v4 setWallpaperEnabled:v3];
}

- (BOOL)isWallpaperEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  unsigned __int8 v3 = [v2 isWallpaperEnabled];

  return v3;
}

- (void)setAllowSnapshots:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  [v4 setAllowSnapshots:v3];
}

- (BOOL)allowSnapshots
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  unsigned __int8 v3 = [v2 allowSnapshots];

  return v3;
}

- (void)setEligibleForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  [v4 setEligibleForFocus:v3];
}

- (BOOL)isEligibleForFocus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneView](self, "sceneView"));
  unsigned __int8 v3 = [v2 isEligibleForFocus];

  return v3;
}

- (void)applicationSceneView:(id)a3 willLoadSnapshotWithRequest:(id)a4
{
}

- (void)applicationSceneViewDidUpdatePresentationMode:(id)a3
{
}

- (void)applicationSceneView:(id)a3 didUpdateReadiness:(BOOL)a4
{
  self->_ready = a4;
  -[PBApplicationSceneViewController didChangeValueForKey:](self, "didChangeValueForKey:", @"ready");
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (BOOL)preferLaunchImageSnapshot
{
  return self->_preferLaunchImageSnapshot;
}

- (void)setPreferLaunchImageSnapshot:(BOOL)a3
{
  self->_preferLaunchImageSnapshot = a3;
}

- (PBSceneDeferralTargetAssertion)deferralTargetAssertion
{
  return self->_deferralTargetAssertion;
}

- (void).cxx_destruct
{
}

@end