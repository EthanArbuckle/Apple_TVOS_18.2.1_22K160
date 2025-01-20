@interface TVSettingsAirPlayAccessViewController
- (TSKSettingItemEditingController)passwordViewController;
- (TVSettingsAirPlayAccessViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)_setAirPlayPassword:(id)a3;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPasswordViewController:(id)a3;
@end

@implementation TVSettingsAirPlayAccessViewController

- (TVSettingsAirPlayAccessViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayAccessViewController;
  v3 = -[TVSettingsAirPlayAccessViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"localAccessory.home" options:0 context:off_1001E0D90];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"localAccessory.home" context:off_1001E0D90];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayAccessViewController;
  -[TVSettingsAirPlayAccessViewController dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1001E0D90)
  {
    -[TVSettingsAirPlayAccessViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayAccessViewController;
    -[TVSettingsAirPlayAccessViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsAirPlayFacade sharedInstance](&OBJC_CLASS___TVSettingsAirPlayFacade, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 securityDescriptionFormatter]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accessDescriptionFormatter]);
  uint64_t v7 = TSKLocString(@"APAccessControlTitle");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 availableAccessModes]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKRadioSettingGroup radioGroupWithTitle:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKRadioSettingGroup,  "radioGroupWithTitle:representedObject:keyPath:availableValues:",  v8,  v3,  @"accessMode",  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 accessValueFormatter]);
  [v10 setLocalizedValueFormatter:v11];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000E5D84;
  v40[3] = &unk_100194E80;
  id v30 = v6;
  id v41 = v30;
  id v12 = v2;
  id v42 = v12;
  id v29 = v5;
  id v43 = v29;
  [v10 setItemUpdateBlock:v40];
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v14 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  uint64_t v15 = TSKLocString(@"APSecurityRequirePasswordTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TSKLocString(@"APSecurityRequirePasswordDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v16,  v18,  v3,  @"securityMode",  0LL,  0LL));

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 availableSecurityModes]);
  [v19 setAvailableValues:v20];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000E5E5C;
  v37[3] = &unk_10018ED70;
  id v21 = v12;
  id v38 = v21;
  id v22 = v4;
  id v39 = v22;
  [v19 setUpdateBlock:v37];
  -[NSMutableArray addObject:](v13, "addObject:", v19);
  objc_initWeak(&location, self);
  uint64_t v23 = TSKLocString(@"APSecurityPassword");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000E5EF4;
  v34[3] = &unk_10018E9D8;
  objc_copyWeak(&v35, &location);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v24,  0LL,  v21,  @"password",  v34));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000E5F98;
  v32[3] = &unk_10018E608;
  id v26 = v21;
  id v33 = v26;
  [v25 setUpdateBlock:v32];
  [v25 setAccessoryTypes:0];
  -[NSMutableArray addObject:](v13, "addObject:", v25);
  -[TSKSettingGroup setSettingItems:](v14, "setSettingItems:", v13);
  v44[0] = v10;
  v44[1] = v14;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v27;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayAccessViewController passwordViewController](self, "passwordViewController"));

  if (v11 == v8)
  {
    -[TVSettingsAirPlayAccessViewController _setAirPlayPassword:](self, "_setAirPlayPassword:", v10);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayAccessViewController;
    -[TVSettingsAirPlayAccessViewController editingController:didProvideValue:forSettingItem:]( &v12,  "editingController:didProvideValue:forSettingItem:",  v8,  v10,  v9);
  }
}

- (void)_setAirPlayPassword:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localAccessory]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);

  if (!v7) {
    goto LABEL_4;
  }
  id v23 = 0LL;
  unsigned __int8 v8 = +[HMHome isValidMediaPassword:error:]( &OBJC_CLASS___HMHome,  "isValidMediaPassword:error:",  v4,  &v23);
  id v9 = v23;
  id v10 = v9;
  if ((v8 & 1) != 0)
  {

LABEL_4:
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
    [v10 setPassword:v4];
    [v10 setSecurityType:2];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayAccessViewController navigationController](self, "navigationController"));
    id v12 = [v11 popToViewController:self animated:1];
    goto LABEL_8;
  }

  uint64_t v13 = TVCSHomeLog(v9);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000FD4D4((uint64_t)v10, v14);
  }

  uint64_t v15 = TSKLocString(@"APSecurityHomeInvalidPasswordAlertTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TSKLocString(@"APSecurityHomeInvalidPasswordAlertMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v16,  v18,  1LL));

  uint64_t v19 = TSKLocString(@"APSecurityHomeInvalidPasswordAlertButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  0LL,  0LL));
  [v11 addAction:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v11 addAction:v22];

  -[TVSettingsAirPlayAccessViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
LABEL_8:
}

- (TSKSettingItemEditingController)passwordViewController
{
  return (TSKSettingItemEditingController *)objc_loadWeakRetained((id *)&self->_passwordViewController);
}

- (void)setPasswordViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end