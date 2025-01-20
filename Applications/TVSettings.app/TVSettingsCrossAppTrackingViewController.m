@interface TVSettingsCrossAppTrackingViewController
- (TVSettingsCrossAppTrackingViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)_toggleCrossAppTrackingAllowed;
- (void)_updateCrossAppTrackingItem:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSettingsCrossAppTrackingViewController

- (TVSettingsCrossAppTrackingViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingViewController;
  v3 = -[TVSettingsCrossAppTrackingViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"crossAppTrackingAllowedSwitchEnabled" options:0 context:&off_1001DFFA0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"crossAppTrackingAllowedSwitchEnabled" context:off_1001DFFA0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingViewController;
  -[TVSettingsCrossAppTrackingViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
  objc_super v4 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  uint64_t v6 = TSKLocString(@"CrossAppTrackingAllowAppsToRequestToTrackTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKLocString(@"CrossAppTrackingAllowAppsToRequestToTrackDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  v9,  v3,  @"crossAppTrackingAllowed",  self,  "_toggleCrossAppTrackingAllowed"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v10 setLocalizedValueFormatter:v11];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10008B758;
  v26[3] = &unk_10018E9B0;
  objc_copyWeak(&v27, &location);
  [v10 setUpdateBlock:v26];
  -[NSMutableArray addObject:](v5, "addObject:", v10);
  uint64_t v12 = TSKLocString(@"CrossAppTrackingLearnMoreTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v13,  0LL,  0LL,  0LL,  &stru_1001924D8));

  [v14 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v5, "addObject:", v14);
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v5);
  uint64_t v15 = TSKLocString(@"CrossAppTrackingAppGroupTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_10008B834;
  v24 = &unk_100192500;
  id v17 = v3;
  id v25 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v16,  v17,  @"infoArray",  &v21));

  v29[0] = v4;
  v29[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v29,  2LL,  v21,  v22,  v23,  v24));

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFFA0 == a6)
  {
    -[TVSettingsCrossAppTrackingViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsCrossAppTrackingViewController;
    -[TVSettingsCrossAppTrackingViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_toggleCrossAppTrackingAllowed
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
  if ([v3 crossAppTrackingAllowed])
  {
    if ([v3 numberOfAppsAllowingCrossAppTracking])
    {
      uint64_t v4 = TSKLocString(@"CrossAppTrackingDisableAllowAppsToRequestToTrackDialogTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      uint64_t v6 = TSKLocString(@"CrossAppTrackingDisableAllowAppsToRequestToTrackDialogDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v7,  1LL));

      uint64_t v9 = TSKLocString(@"CrossAppTrackingDisableStopAskingAndTurnOffAllAppsTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10008BC44;
      v24[3] = &unk_10018F018;
      id v11 = v3;
      id v25 = v11;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  0LL,  v24));
      [v8 addAction:v12];

      uint64_t v13 = TSKLocString(@"CrossAppTrackingDisableStopAskingAndLeaveAppsOnTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472LL;
      v21 = sub_10008BC70;
      uint64_t v22 = &unk_10018F018;
      id v23 = v11;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  &v19));
      objc_msgSend(v8, "addAction:", v15, v19, v20, v21, v22);

      uint64_t v16 = TSKLocString(@"SettingsCancel");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  0LL));
      [v8 addAction:v18];

      -[TVSettingsCrossAppTrackingViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
    }

    else
    {
      [v3 setCrossAppTrackingAllowed:0];
      [v3 resetAdvertisingIdentifier];
    }
  }

  else
  {
    [v3 setCrossAppTrackingAllowed:1];
  }
}

- (void)_updateCrossAppTrackingItem:(id)a3 value:(id)a4
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v5, "crossAppTrackingAllowedSwitchEnabled"));
}

@end