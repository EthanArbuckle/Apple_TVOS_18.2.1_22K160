@interface PBWorkspaceHandle
- (CGRect)bounds;
- (CGRect)fullDisplayBounds;
- (FBSDisplayConfiguration)displayConfiguration;
- (PBWorkspaceHandle)initWithWorkspace:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
- (id)configurationForIdentity:(id)a3;
- (id)newApplicationSceneDeactivationAssertionWithReason:(int64_t)a3;
- (void)executeTransitionRequest:(id)a3;
- (void)registerScene:(id)a3;
- (void)unregisterScene:(id)a3;
@end

@implementation PBWorkspaceHandle

- (PBWorkspaceHandle)initWithWorkspace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBWorkspaceHandle;
  v6 = -[PBWorkspaceHandle init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (void)executeTransitionRequest:(id)a3
{
}

- (id)newApplicationSceneDeactivationAssertionWithReason:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace sceneDeactivationManager](self->_workspace, "sceneDeactivationManager"));
  id v5 = [v4 newAssertionWithReason:a3];

  return v5;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return (FBSDisplayConfiguration *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspace _displayConfiguration]( self->_workspace,  "_displayConfiguration"));
}

- (id)configurationForIdentity:(id)a3
{
  workspace = self->_workspace;
  if (workspace) {
    displayConfigurationProvider = workspace->_displayConfigurationProvider;
  }
  else {
    displayConfigurationProvider = 0LL;
  }
  return (id)objc_claimAutoreleasedReturnValue( -[PBDisplayConfigurationProviding configurationForIdentity:]( displayConfigurationProvider,  "configurationForIdentity:",  a3));
}

- (void)registerScene:(id)a3
{
}

- (void)unregisterScene:(id)a3
{
}

- (CGRect)bounds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace geometry](self->_workspace, "geometry"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)fullDisplayBounds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace geometry](self->_workspace, "geometry"));
  [v2 fullDisplayBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace geometry](self->_workspace, "geometry"));
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  workspace = self->_workspace;
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspace geometry](workspace, "geometry"));
  [v5 safeAreaInsetsForApplication:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void).cxx_destruct
{
}

@end