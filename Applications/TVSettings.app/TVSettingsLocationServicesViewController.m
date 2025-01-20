@interface TVSettingsLocationServicesViewController
- (id)loadSettingGroups;
- (void)toggleLocationServicesEnabled:(id)a3;
@end

@implementation TVSettingsLocationServicesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessTypeFormatter]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10000BF34;
  v33[3] = &unk_10018E608;
  id v34 = v3;
  id v5 = v3;
  v6 = objc_retainBlock(v33);
  v7 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
  uint64_t v10 = TSKLocString(@"LocationServicesMasterTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = TSKLocString(@"LocationServicesMasterDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  v13,  v5,  @"locationServicesEnabled",  self,  "toggleLocationServicesEnabled:"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v14 setLocalizedValueFormatter:v15];

  [v9 addObject:v14];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.locationservices"));

  [v9 addObject:v16];
  -[TSKSettingGroup setSettingItems:](v7, "setSettingItems:", v9);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000BF78;
  v30[3] = &unk_10018E728;
  id v31 = v4;
  id v32 = v6;
  id v29 = v4;
  v28 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v5,  @"applicationItems",  v30));
  v18 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v19 = TSKLocString(@"LocationServicesSystemTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v20,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsLocationSystemServicesViewController));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v37 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  -[TSKSettingGroup setSettingItems:](v18, "setSettingItems:", v23);

  v35[1] = v18;
  v36[0] = v7;
  v35[0] = v17;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  0LL,  v24));
  v36[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));

  return v26;
}

- (void)toggleLocationServicesEnabled:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", a3));
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = TSKLocString(@"LocationServicesTurnOffDescription");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v7 = TSKLocString(@"LocationServicesTurnOffTitle");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = &stru_10018E768;
  }

  else
  {
    uint64_t v10 = TSKLocString(@"LocationServicesTurnOnDescription");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v11 = TSKLocString(@"LocationServicesTurnOnTitle");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9 = &stru_10018E788;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  v9));

  uint64_t v13 = TSKLocString(@"SettingsCancel");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v17,  1LL));
  [v16 addAction:v12];
  [v16 addAction:v15];
  -[TVSettingsLocationServicesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v16,  1LL,  0LL);
}

@end