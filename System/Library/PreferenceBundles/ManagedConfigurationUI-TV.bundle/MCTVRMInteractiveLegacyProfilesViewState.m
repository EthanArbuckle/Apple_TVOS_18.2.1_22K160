@interface MCTVRMInteractiveLegacyProfilesViewState
- (BOOL)isConfigEnabled;
- (MCTVRMInteractiveLegacyProfilesViewController)viewController;
- (MCTVRMInteractiveLegacyProfilesViewState)initWithViewController:(id)a3;
- (void)setIsConfigEnabled:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)updateState;
@end

@implementation MCTVRMInteractiveLegacyProfilesViewState

- (MCTVRMInteractiveLegacyProfilesViewState)initWithViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCTVRMInteractiveLegacyProfilesViewState;
  v5 = -[MCTVRMInteractiveLegacyProfilesViewState init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 rmuiProfileViewModel]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 toggleViewModel]);
    v6->_isConfigEnabled = [v8 toggleState];
  }

  return v6;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewState viewController](self, "viewController"));
  if (v4)
  {
    id v5 = v4;
    [v4 setIsConfigEnabled:v3];
    id v4 = v5;
  }
}

- (void)updateState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewState viewController](self, "viewController"));
  if (v3)
  {
    id v6 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rmuiProfileViewModel]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 toggleViewModel]);
    self->_isConfigEnabled = [v5 toggleState];

    BOOL v3 = v6;
  }
}

- (MCTVRMInteractiveLegacyProfilesViewController)viewController
{
  return (MCTVRMInteractiveLegacyProfilesViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (void).cxx_destruct
{
}

@end