@interface MCTVRMInteractiveLegacyProfilesViewController
- (MCTVRMInteractiveLegacyProfilesViewController)initWithRMUIConfigurationInterface:(id)a3 profileViewModel:(id)a4;
- (MCTVRMInteractiveLegacyProfilesViewState)viewState;
- (RMUIConfigurationInterface)rmuiConfigInterface;
- (RMUIProfileViewModel)rmuiProfileViewModel;
- (id)loadSettingGroups;
- (void)_presentAlertForErrorModel:(id)a3;
- (void)setIsConfigEnabled:(BOOL)a3;
- (void)setRmuiConfigInterface:(id)a3;
- (void)setRmuiProfileViewModel:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation MCTVRMInteractiveLegacyProfilesViewController

- (MCTVRMInteractiveLegacyProfilesViewController)initWithRMUIConfigurationInterface:(id)a3 profileViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCTVRMInteractiveLegacyProfilesViewController;
  v9 = -[MCTVRMInteractiveLegacyProfilesViewController initWithStyle:](&v16, "initWithStyle:", 1LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rmuiConfigInterface, a3);
    objc_storeStrong((id *)&v10->_rmuiProfileViewModel, a4);
    v11 = -[MCTVRMInteractiveLegacyProfilesViewState initWithViewController:]( objc_alloc(&OBJC_CLASS___MCTVRMInteractiveLegacyProfilesViewState),  "initWithViewController:",  v10);
    viewState = v10->_viewState;
    v10->_viewState = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiProfileViewModel](v10, "rmuiProfileViewModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
    -[MCTVRMInteractiveLegacyProfilesViewController setTitle:](v10, "setTitle:", v14);
  }

  return v10;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiProfileViewModel](self, "rmuiProfileViewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController viewState](self, "viewState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v4,  0LL,  v5,  @"isConfigEnabled",  0LL,  0LL));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_13E28;
  v20[3] = &unk_28660;
  v20[4] = self;
  [v6 setUpdateBlock:v20];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiProfileViewModel](self, "rmuiProfileViewModel"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 profileIdentifier]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiProfileViewModel](self, "rmuiProfileViewModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 interactiveDetailsText]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_13EC8;
  v18[3] = &unk_28A70;
  id v19 = v8;
  id v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v10,  0LL,  0LL,  0LL,  v18));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_13EF8;
  v17[3] = &unk_28660;
  v17[4] = self;
  [v12 setUpdateBlock:v17];
  v21[0] = v6;
  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v13));
  v22 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));

  return v15;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiConfigInterface](self, "rmuiConfigInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMInteractiveLegacyProfilesViewController rmuiProfileViewModel](self, "rmuiProfileViewModel"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_14038;
  v7[3] = &unk_28D98;
  objc_copyWeak(&v8, &location);
  [v5 setConfigurationActivated:v3 forViewModel:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_presentAlertForErrorModel:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v6,  1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 okText]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  0LL,  0LL));
  [v9 addAction:v8];

  -[MCTVRMInteractiveLegacyProfilesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (RMUIConfigurationInterface)rmuiConfigInterface
{
  return self->_rmuiConfigInterface;
}

- (void)setRmuiConfigInterface:(id)a3
{
}

- (RMUIProfileViewModel)rmuiProfileViewModel
{
  return self->_rmuiProfileViewModel;
}

- (void)setRmuiProfileViewModel:(id)a3
{
}

- (MCTVRMInteractiveLegacyProfilesViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end