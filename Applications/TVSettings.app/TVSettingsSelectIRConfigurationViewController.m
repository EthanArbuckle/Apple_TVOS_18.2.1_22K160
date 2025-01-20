@interface TVSettingsSelectIRConfigurationViewController
- (TVSettingsRemotesFacade)remotesFacade;
- (TVSettingsSelectIRConfigurationViewController)init;
- (id)loadSettingGroups;
- (void)_confirmCECVolumeControlForConfiguration:(id)a3;
- (void)_didSelectAddConfiguration;
- (void)_didSelectConfiguration:(id)a3;
- (void)_didSelectEditConfigurations;
- (void)setRemotesFacade:(id)a3;
@end

@implementation TVSettingsSelectIRConfigurationViewController

- (TVSettingsSelectIRConfigurationViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsSelectIRConfigurationViewController;
  v2 = -[TVSettingsSelectIRConfigurationViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = TSKLocString(@"RCSelectIRConfigurationTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[TVSettingsSelectIRConfigurationViewController setTitle:](v2, "setTitle:", v4);
  }

  return v2;
}

- (id)loadSettingGroups
{
  remotesFacade = self->_remotesFacade;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000AF6AC;
  v15[3] = &unk_100192C78;
  v15[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  remotesFacade,  @"volumeConfigurations",  v15));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = TSKLocString(@"RCVCEditMenuItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  self->_remotesFacade,  @"editableVolumeConfigurations",  self,  "_didSelectEditConfigurations"));

  [v8 setUpdateBlock:&stru_100193660];
  -[NSMutableArray addObject:](v5, "addObject:", v8);
  uint64_t v9 = TSKLocString(@"RCVCAddMenuItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  self,  "_didSelectAddConfiguration"));

  -[NSMutableArray addObject:](v5, "addObject:", v11);
  v12 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  -[TSKSettingGroup setSettingItems:](v12, "setSettingItems:", v5);
  v16[0] = v4;
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));

  return v13;
}

- (void)_didSelectConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TSKSettingItem);
  id v6 = v4;
  id v19 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v7 = v19;
    }
    else {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  id v11 = v9;
  v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      v13 = v12;
    }
    else {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  id v14 = v13;

  id v15 = [v14 configurationType];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesFacade volumeConfigurations](self->_remotesFacade, "volumeConfigurations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bs_firstObjectPassingTest:", &stru_1001936A0));

  id v18 = [v17 configurationType];
  if (v15 != (id)2 || v18 == (id)2) {
    -[TVSettingsRemotesFacade selectConfiguration:](self->_remotesFacade, "selectConfiguration:", v14);
  }
  else {
    -[TVSettingsSelectIRConfigurationViewController _confirmCECVolumeControlForConfiguration:]( self,  "_confirmCECVolumeControlForConfiguration:",  v14);
  }
}

- (void)_didSelectAddConfiguration
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsLearnRemoteViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration volumeConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "volumeConfigurationForDeviceWithUUID:",  0LL));
  -[TVSettingsLearnRemoteViewController setConfiguration:](v3, "setConfiguration:", v4);

  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_1000AFB00;
  uint64_t v9 = &unk_1001936C8;
  objc_copyWeak(&v10, &location);
  -[TVSettingsLearnRemoteViewController setCompletionHandler:](v3, "setCompletionHandler:", &v6);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSelectIRConfigurationViewController navigationController]( self,  "navigationController",  v6,  v7,  v8,  v9));
  [v5 pushViewController:v3 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_didSelectEditConfigurations
{
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsEditIRConfigurationsViewController);
  -[TVSettingsEditIRConfigurationsViewController setRemotesFacade:](v4, "setRemotesFacade:", self->_remotesFacade);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSelectIRConfigurationViewController navigationController](self, "navigationController"));
  [v3 pushViewController:v4 animated:1];
}

- (void)_confirmCECVolumeControlForConfiguration:(id)a3
{
  id v5 = a3;
  if ([v5 configurationType] == (id)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemotesFacade volumeConfigurations](self->_remotesFacade, "volumeConfigurations"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_firstObjectPassingTest:", &stru_1001936E8));

    -[TVSettingsRemotesFacade selectConfiguration:](self->_remotesFacade, "selectConfiguration:", v5);
    uint64_t v8 = TSKLocString(@"RCVCCECAssistantTitle");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = TSKLocString(@"RCVCCECAssistantMessage");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v11,  1LL));

    uint64_t v13 = TSKLocString(@"RCVCCECAssistantOKButton");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  &stru_100193708));
    [v12 addAction:v15];

    objc_initWeak(&location, self);
    uint64_t v16 = TSKLocString(@"RCVCCECAssistantCancelButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000AFF88;
    v21[3] = &unk_10018F4C0;
    objc_copyWeak(&v23, &location);
    id v18 = v7;
    id v22 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  v21));
    [v12 addAction:v19];

    -[TVSettingsSelectIRConfigurationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[configuration configurationType] == TVSRemoteConfigurationType_ForcedCEC"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FAD70(a2, (uint64_t)self, (uint64_t)v20);
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
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