@interface DTTVNLCViewController
- (DTTVNLCProfileStore)profileStore;
- (DTTVNLCViewController)initWithProfileStore:(id)a3;
- (id)loadSettingGroups;
- (id)profileNameFormatter;
- (void)setProfileStore:(id)a3;
- (void)showInfo:(id)a3;
@end

@implementation DTTVNLCViewController

- (DTTVNLCViewController)initWithProfileStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DTTVNLCViewController;
  v6 = -[DTTVNLCViewController initWithStyle:](&v9, "initWithStyle:", 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profileStore, a3);
  }

  return v7;
}

- (id)loadSettingGroups
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"NLCEnableTitle" value:&stru_18BA0 table:@"Localizable"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v6,  0LL,  self->_profileStore,  @"NLCEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v3, "addObject:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v3));
  objc_initWeak(&location, self);
  v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"NLCProfilesGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  profileStore = self->_profileStore;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles allProfilesArray](profileStore, "allProfilesArray"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKRadioSettingGroup radioGroupWithTitle:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKRadioSettingGroup,  "radioGroupWithTitle:representedObject:keyPath:availableValues:",  v10,  profileStore,  @"selectedProfileName",  v12));

  v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"NLCProfilesMoreInfoDescription" value:&stru_18BA0 table:@"Localizable"]);
  [v13 setLocalizedDescription:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCViewController profileNameFormatter](self, "profileNameFormatter"));
  [v13 setLocalizedValueFormatter:v17];

  [v13 setTarget:self];
  [v13 setPlayButtonAction:"showInfo:"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_5004;
  v29[3] = &unk_18630;
  objc_copyWeak(&v30, &location);
  [v13 setUpdateBlock:v29];
  v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"NLCProfilesAddNewGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_5078;
  v27[3] = &unk_18658;
  objc_copyWeak(&v28, &location);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v21,  0LL,  0LL,  0LL,  v27));

  -[NSMutableArray addObject:](v18, "addObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v18));
  v32[0] = v26;
  v32[1] = v13;
  v32[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL));

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
  return v24;
}

- (void)showInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___DTTVNLCInfoViewController);
  profileStore = self->_profileStore;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);

  objc_super v9 = -[DTTVNLCInfoViewController initWithProfileStore:profileName:]( v5,  "initWithProfileStore:profileName:",  profileStore,  v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVNLCViewController navigationController](self, "navigationController"));
  [v8 pushViewController:v9 animated:1];
}

- (id)profileNameFormatter
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5254;
  v5[3] = &unk_18680;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithFormattingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (DTTVNLCProfileStore)profileStore
{
  return self->_profileStore;
}

- (void)setProfileStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end