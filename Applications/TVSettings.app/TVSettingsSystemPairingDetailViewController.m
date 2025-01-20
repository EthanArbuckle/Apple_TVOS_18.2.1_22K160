@interface TVSettingsSystemPairingDetailViewController
- (TVSettingsSystemPairingsPairing)device;
- (id)loadSettingGroups;
- (void)setDevice:(id)a3;
- (void)unpairDevice:(id)a3;
@end

@implementation TVSettingsSystemPairingDetailViewController

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"SystemPairingsManageForgetDeviceTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v4,  0LL,  0LL,  0LL,  self,  "unpairDevice:"));

  uint64_t v6 = TSKLocString(@"SystemPairingsManageSectionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v7,  v8));

  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  return v10;
}

- (void)setDevice:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 displayName]);

  -[TVSettingsSystemPairingDetailViewController setTitle:](self, "setTitle:", v6);
}

- (void)unpairDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingDetailViewController device](self, "device"));
  uint64_t v6 = TSKLocString(@"SystemPairingsUnpairTitleFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  uint64_t v10 = TSKLocString(@"SystemPairingsUnpairInstructions");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v11,  1LL));
  objc_initWeak(&location, self);
  uint64_t v13 = TSKLocString(@"SettingsRemove");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100039614;
  v20[3] = &unk_10018FF80;
  v20[4] = self;
  objc_copyWeak(&v21, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  2LL,  v20));

  [v12 addAction:v15];
  uint64_t v16 = TSKLocString(@"SettingsCancel");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  0LL));

  [v12 addAction:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSystemPairingDetailViewController navigationController](self, "navigationController"));
  [v19 presentViewController:v12 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (TVSettingsSystemPairingsPairing)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end