@interface TVSettingsUserTCCViewController
- (id)facade;
- (id)loadSettingGroups;
- (void)_showResetConfirmation:(id)a3;
@end

@implementation TVSettingsUserTCCViewController

- (id)facade
{
  return +[TVSettingsUserAccessFacade sharedInstance](&OBJC_CLASS___TVSettingsUserAccessFacade, "sharedInstance");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserTCCViewController facade](self, "facade"));
  uint64_t v4 = TSKLocString(@"UserAccessOnDeviceTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = TSKLocString(@"UserAccessOnDeviceDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v5,  v7,  v3,  @"enabledOnDevice",  0LL,  0LL));

  uint64_t v9 = TSKLocString(@"UserResetDataTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"UserResetDataDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  v12,  0LL,  0LL,  self,  "_showResetConfirmation:"));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C5F18;
  v25[3] = &unk_10018E608;
  id v14 = v3;
  id v26 = v14;
  [v13 setUpdateBlock:v25];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v8, v13, 0LL));
  v16 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  -[TSKSettingGroup setSettingItems:](v16, "setSettingItems:", v15);
  uint64_t v17 = TSKLocString(@"UserAppGroupTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v18,  v14,  @"infoArray",  &stru_100193EC0));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C6054;
  v23[3] = &unk_10018E608;
  id v24 = v14;
  id v20 = v14;
  [v19 setUpdateBlock:v23];
  v27[0] = v16;
  v27[1] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));

  return v21;
}

- (void)_showResetConfirmation:(id)a3
{
  uint64_t v4 = TSKLocString(@"UserConfirmResetDataTitle");
  id v15 = (id)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v5 = TSKLocString(@"UserConfirmResetDataMessage");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v15,  v6,  1LL));
  uint64_t v8 = TSKLocString(@"UserConfirmResetDataGoButtonTitle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  2LL,  &stru_100193EE0));

  [v7 addAction:v10];
  uint64_t v11 = TSKLocString(@"UserConfirmResetDataCancelButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  0LL));

  [v7 addAction:v13];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserTCCViewController navigationController](self, "navigationController"));
  [v14 presentViewController:v7 animated:1 completion:0];
}

@end