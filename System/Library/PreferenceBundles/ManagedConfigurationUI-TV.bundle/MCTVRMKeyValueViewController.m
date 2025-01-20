@interface MCTVRMKeyValueViewController
- (MCTVRMKeyValueViewController)initWithRMUIConfigurationInterface:(id)a3 pluginViewModel:(id)a4;
- (RMUIConfigurationInterface)rmuiConfigInterface;
- (RMUIPluginViewModel)rmuiPluginViewModel;
- (id)loadSettingGroups;
- (void)setRmuiConfigInterface:(id)a3;
- (void)setRmuiPluginViewModel:(id)a3;
@end

@implementation MCTVRMKeyValueViewController

- (MCTVRMKeyValueViewController)initWithRMUIConfigurationInterface:(id)a3 pluginViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCTVRMKeyValueViewController;
  v9 = -[MCTVRMKeyValueViewController initWithStyle:](&v14, "initWithStyle:", 1LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rmuiConfigInterface, a3);
    objc_storeStrong((id *)&v10->_rmuiPluginViewModel, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMKeyValueViewController rmuiPluginViewModel](v10, "rmuiPluginViewModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
    -[MCTVRMKeyValueViewController setTitle:](v10, "setTitle:", v12);
  }

  return v10;
}

- (id)loadSettingGroups
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMKeyValueViewController rmuiPluginViewModel](self, "rmuiPluginViewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 detailViewModels]);
  v6 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v5 count]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRMKeyValueViewController rmuiPluginViewModel](self, "rmuiPluginViewModel", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 detailViewModels]);

  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v14,  0LL,  v13,  @"value"));

        -[NSMutableArray addObject:](v6, "addObject:", v15);
      }

      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
  v23 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));

  return v17;
}

- (RMUIConfigurationInterface)rmuiConfigInterface
{
  return self->_rmuiConfigInterface;
}

- (void)setRmuiConfigInterface:(id)a3
{
}

- (RMUIPluginViewModel)rmuiPluginViewModel
{
  return self->_rmuiPluginViewModel;
}

- (void)setRmuiPluginViewModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end