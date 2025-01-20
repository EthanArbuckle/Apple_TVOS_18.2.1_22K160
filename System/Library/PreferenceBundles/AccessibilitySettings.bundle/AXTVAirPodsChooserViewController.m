@interface AXTVAirPodsChooserViewController
- (AXTVAirPodsChooserViewController)initWithDevices:(id)a3;
- (NSArray)devices;
- (id)loadSettingGroups;
- (id)title;
- (void)setDevices:(id)a3;
@end

@implementation AXTVAirPodsChooserViewController

- (AXTVAirPodsChooserViewController)initWithDevices:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVAirPodsChooserViewController;
  v5 = -[AXTVAirPodsChooserViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[AXTVAirPodsChooserViewController setDevices:](v5, "setDevices:", v4);
  }

  return v6;
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 disambiguationString]);

  return v3;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsChooserViewController devices](self, "devices"));
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    v15 = v3;
    v7 = 0LL;
    uint64_t v8 = *(void *)v19;
    do
    {
      v9 = 0LL;
      v10 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_6B14;
        v17[3] = &unk_65200;
        v17[4] = v11;
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v12,  0LL,  0LL,  0LL,  v17));

        [v7 setEnabledInStoreDemoMode:1];
        [v4 addObject:v7];
        v9 = (char *)v9 + 1;
        v10 = v7;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);

    v3 = v15;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v4));
  [v3 addObject:v13];

  return v3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end