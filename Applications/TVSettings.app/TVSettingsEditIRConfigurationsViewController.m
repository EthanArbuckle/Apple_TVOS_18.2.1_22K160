@interface TVSettingsEditIRConfigurationsViewController
- (TVSettingsEditIRConfigurationsViewController)init;
- (TVSettingsRemotesFacade)remotesFacade;
- (id)loadSettingGroups;
- (void)_editIRConfiguration:(id)a3;
- (void)setRemotesFacade:(id)a3;
@end

@implementation TVSettingsEditIRConfigurationsViewController

- (TVSettingsEditIRConfigurationsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsEditIRConfigurationsViewController;
  v2 = -[TVSettingsEditIRConfigurationsViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = TSKLocString(@"RCEditIRConfigurationTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[TVSettingsEditIRConfigurationsViewController setTitle:](v2, "setTitle:", v4);
  }

  return v2;
}

- (id)loadSettingGroups
{
  remotesFacade = self->_remotesFacade;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009DB30;
  v6[3] = &unk_100192C78;
  v6[4] = self;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  remotesFacade,  @"editableVolumeConfigurations",  v6));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v4;
}

- (void)_editIRConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  id v10 = v9;

  objc_initWeak(location, self);
  uint64_t v11 = TSKLocString(@"RCEditIRDeviceDialogTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  0LL,  1LL));
  uint64_t v16 = TSKLocString(@"RCEditIRDeviceRenameButtonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10009DF40;
  v35[3] = &unk_10018F4C0;
  objc_copyWeak(&v37, location);
  id v18 = v10;
  id v36 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v35));
  v29 = (void *)v14;

  [v15 addAction:v19];
  uint64_t v20 = TSKLocString(@"RCEditIRDeviceDeleteButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10009E0D0;
  v31[3] = &unk_100192CA0;
  v31[4] = self;
  id v22 = v4;
  id v32 = v22;
  objc_copyWeak(&v34, location);
  id v23 = v18;
  id v33 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  2LL,  v31));

  [v15 addAction:v24];
  uint64_t v25 = TSKLocString(@"RCDeleteIRDeviceCancelText");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10009E418;
  v30[3] = &unk_10018F018;
  v30[4] = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v26,  1LL,  v30));

  [v15 addAction:v27];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsEditIRConfigurationsViewController navigationController](self, "navigationController"));
  [v28 presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(location);
}

- (TVSettingsRemotesFacade)remotesFacade
{
  return self->_remotesFacade;
}

- (void)setRemotesFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end