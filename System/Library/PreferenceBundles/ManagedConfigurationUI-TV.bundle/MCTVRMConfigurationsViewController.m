@interface MCTVRMConfigurationsViewController
- (MCTVRMConfigurationsViewController)initWithConfigurationInterface:(id)a3;
- (RMUIConfigurationInterface)rmuiConfigInterface;
- (id)_pluginsSection:(id)a3;
- (id)_profilesGroup;
- (id)loadSettingGroups;
- (void)dealloc;
- (void)setRmuiConfigInterface:(id)a3;
@end

@implementation MCTVRMConfigurationsViewController

- (MCTVRMConfigurationsViewController)initWithConfigurationInterface:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCTVRMConfigurationsViewController;
  v6 = -[MCTVRMConfigurationsViewController initWithStyle:](&v12, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rmuiConfigInterface, a3);
    id v8 = MCUILocalizedString(@"CONFIGURATIONS");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MCTVRMConfigurationsViewController setTitle:](v7, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v10 addObserver:v7 selector:"reloadSettings" name:RMUIConfigurationsDidChangeNotification object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVRMConfigurationsViewController;
  -[MCTVRMConfigurationsViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profileViewModels]);
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController _profilesGroup](self, "_profilesGroup"));
      [v4 addObject:v8];
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pluginSectionViewModels]);
    id v11 = [v10 count];

    if (v11)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface", 0LL));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pluginSectionViewModels]);

      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          v17 = 0LL;
          do
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVRMConfigurationsViewController _pluginsSection:]( self,  "_pluginsSection:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v17)));
            [v4 addObject:v18];

            v17 = (char *)v17 + 1;
          }

          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v15);
      }
    }
  }

  else
  {
    objc_super v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)_profilesGroup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface"));

  if (!v3) {
    return objc_opt_new(&OBJC_CLASS___TSKListSettingGroup);
  }
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMConfigurationsViewController rmuiConfigInterface](self, "rmuiConfigInterface"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profileDeclarationsHeading]);
  rmuiConfigInterface = self->_rmuiConfigInterface;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_13564;
  v9[3] = &unk_28CE0;
  v9[4] = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  rmuiConfigInterface,  @"profileViewModels",  v9));

  return v7;
}

- (id)_pluginsSection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 heading]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_13808;
  v8[3] = &unk_28CE0;
  v8[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  v4,  @"viewModels",  v8));

  return v6;
}

- (RMUIConfigurationInterface)rmuiConfigInterface
{
  return self->_rmuiConfigInterface;
}

- (void)setRmuiConfigInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end