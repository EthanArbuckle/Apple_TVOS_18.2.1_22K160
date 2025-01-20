@interface TVSettingsAppearanceViewController
- (TVSettingsAppearanceViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)_promptUserToEnablePermissions;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)selectItem:(id)a3;
- (void)selectUIScale:(id)a3;
@end

@implementation TVSettingsAppearanceViewController

- (TVSettingsAppearanceViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsAppearanceViewController;
  v3 = -[TVSettingsAppearanceViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"systemAppearance" options:0 context:off_1001DFCC0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUIScaleFacade sharedInstance](&OBJC_CLASS___TVSettingsUIScaleFacade, "sharedInstance"));
    [v5 addObserver:v3 forKeyPath:@"uiScale" options:0 context:off_1001DFCC8];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"systemAppearance" context:off_1001DFCC0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUIScaleFacade sharedInstance](&OBJC_CLASS___TVSettingsUIScaleFacade, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"uiScale" context:off_1001DFCC8];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAppearanceViewController;
  -[TVSettingsAppearanceViewController dealloc](&v5, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100065D7C;
  v16[3] = &unk_1001911B0;
  id v4 = v3;
  id v17 = v4;
  objc_copyWeak(&v18, &location);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"appearanceOptions",  v16));
  if (_os_feature_enabled_impl("PineBoard", "Coolport"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUIScaleFacade sharedInstance](&OBJC_CLASS___TVSettingsUIScaleFacade, "sharedInstance"));
    uint64_t v7 = TSKLocString(@"UIScaleTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100066058;
    v13[3] = &unk_1001911D8;
    id v9 = v6;
    id v14 = v9;
    objc_copyWeak(&v15, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v8,  v9,  @"scaleOptions",  v13));

    v21[0] = v5;
    v21[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));

    objc_destroyWeak(&v15);
  }

  else
  {
    v20 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFCC0 == a6 || off_1001DFCC8 == a6)
  {
    -[TVSettingsAppearanceViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsAppearanceViewController;
    -[TVSettingsAppearanceViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)selectItem:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsAppearanceFacade sharedInstance](&OBJC_CLASS___TVSettingsAppearanceFacade, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);

  objc_msgSend(v5, "setSystemAppearance:", objc_msgSend(v4, "integerValue"));
}

- (void)selectUIScale:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsUIScaleFacade sharedInstance](&OBJC_CLASS___TVSettingsUIScaleFacade, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);

  objc_msgSend(v5, "setUIScale:", objc_msgSend(v4, "integerValue"));
}

- (void)_promptUserToEnablePermissions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  unsigned int v4 = [v3 locationServicesEnabled];

  BOOL v5 = sub_100065F7C();
  v6 = @"SystemAppearanceAutomaticLocationServicesDisabledTitle";
  if (v5) {
    v6 = @"SystemAppearanceAutomaticLocationServicesAndTimeZoneDisabledTitle";
  }
  objc_super v7 = @"SystemAppearanceAutomaticLocationServicesDisabledMessage";
  if (v5) {
    objc_super v7 = @"SystemAppearanceAutomaticLocationServicesAndTimeZoneDisabledMessage";
  }
  v8 = @"SystemAppearanceAutomaticLocationServicesAndTimeZoneDisabledActionTitle";
  if (!v5) {
    v8 = @"SystemAppearanceAutomaticLocationServicesDisabledActionTitle";
  }
  BOOL v9 = v4 == 0;
  if (v4) {
    v10 = @"SystemAppearanceAutomaticTimeZoneDisabledTitle";
  }
  else {
    v10 = v6;
  }
  if (v4) {
    v11 = @"SystemAppearanceAutomaticTimeZoneDisabledMessage";
  }
  else {
    v11 = v7;
  }
  if (v9) {
    v12 = v8;
  }
  else {
    v12 = @"SystemAppearanceAutomaticTimeZoneDisabledActionTitle";
  }
  uint64_t v13 = TSKLocString(v10);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = TSKLocString(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TSKLocString(v12);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v16,  1LL));
  objc_initWeak(&location, self);
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_100066578;
  v27 = &unk_10018F4E8;
  objc_copyWeak(&v28, &location);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  0LL,  &v24));
  objc_msgSend(v19, "addAction:", v20, v24, v25, v26, v27);

  uint64_t v21 = TSKLocString(@"Cancel");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  1LL,  0LL));
  [v19 addAction:v23];

  -[TVSettingsAppearanceViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

@end