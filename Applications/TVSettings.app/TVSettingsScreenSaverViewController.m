@interface TVSettingsScreenSaverViewController
- (TVSettingsScreenSaverViewController)initWithStyle:(int64_t)a3;
- (id)_descriptionForToggleViewModel:(id)a3;
- (id)loadSettingGroups;
- (void)_playButtonPressed:(id)a3;
- (void)_selectStyle:(id)a3;
- (void)_selectStyleAndShowTransitionsMenu:(id)a3;
- (void)_showPreview:(id)a3;
- (void)_updateStartDelayItem:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSettingsScreenSaverViewController

- (TVSettingsScreenSaverViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverViewController;
  v3 = -[TVSettingsScreenSaverViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"selectedPhotoCollection" options:0 context:off_1001DF418];
    [v4 addObserver:v3 forKeyPath:@"screenSaverStyle" options:0 context:off_1001DF420];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"selectedPhotoCollection" context:off_1001DF418];
  [v3 removeObserver:self forKeyPath:@"screenSaverStyle" context:off_1001DF420];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverViewController;
  -[TVSettingsScreenSaverViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  v64 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  objc_super v4 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
  uint64_t v5 = TSKLocString(@"SaverStyleTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"SaverDescriptionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v6,  v8,  v2,  @"screenSaverType",  objc_opt_class(&OBJC_CLASS___TVSettingsScreenSaverTypesViewController));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  [v10 setUpdateBlock:&stru_10018EF30];
  [v4 addObject:v10];
  uint64_t v11 = TSKLocString(@"SaverBackdropTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = TSKLocString(@"SaverBackdropThemeDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_100018028;
  v82[3] = &unk_10018EC30;
  id v15 = v2;
  id v83 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v12,  v14,  v15,  @"idleScreenThemes",  v82));

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10001805C;
  v80[3] = &unk_10018E608;
  id v17 = v15;
  id v81 = v17;
  [v16 setUpdateBlock:v80];
  [v4 addObject:v16];
  uint64_t v18 = TSKLocString(@"SaverBackdropLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = TSKLocString(@"SaverBackdropLibraryEnabledDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_1000180EC;
  v78[3] = &unk_10018EC30;
  id v22 = v17;
  id v79 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v19,  v21,  v22,  @"selectedLibraryFilterName",  v78));

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100018120;
  v76[3] = &unk_10018E608;
  id v24 = v22;
  id v77 = v24;
  [v23 setUpdateBlock:v76];
  [v4 addObject:v23];
  uint64_t v25 = TSKLocString(@"SaverBackdropSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v26,  0LL,  v24,  @"isPhotosSourceStateOn",  0LL,  0LL));

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_100018240;
  v73[3] = &unk_10018ED70;
  id v28 = v24;
  id v74 = v28;
  v75 = self;
  [v27 setUpdateBlock:v73];
  [v4 addObject:v27];
  uint64_t v29 = TSKLocString(@"SaverBackdropRefreshActionTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  uint64_t v31 = TSKLocString(@"SaverBackdropRefreshDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v28 availableIdleScreenRefreshIntervals]);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v30,  v32,  v28,  @"selectedIdleScreenRefreshInterval",  v33));

  uint64_t v35 = TSKLocString(@"SaverBackdropRefreshTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  [v34 setDetailedLocalizedTitle:v36];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_100018314;
  v71[3] = &unk_10018E608;
  id v37 = v28;
  id v72 = v37;
  [v34 setUpdateBlock:v71];
  id v38 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_10018EF50];
  [v34 setLocalizedValueFormatter:v38];

  [v4 addObject:v34];
  uint64_t v39 = TSKLocString(@"SaverStartDelayActionTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v37 availableActivationDelays]);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v40,  0LL,  v37,  @"activationDelay",  v41));

  uint64_t v43 = TSKLocString(@"SaverStartDelayTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  [v42 setDetailedLocalizedTitle:v44];

  [v42 setEnabledInStoreDemoMode:1];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_100018370;
  v69[3] = &unk_10018E9B0;
  objc_copyWeak(&v70, &location);
  [v42 setUpdateBlock:v69];
  [v4 addObject:v42];
  uint64_t v45 = TSKLocString(@"SaverShowDuringMusicTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  uint64_t v47 = TSKLocString(@"SaverShowDuringMusicOn");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  uint64_t v49 = TSKLocString(@"SaverShowDuringMusicOff");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v46,  0LL,  v37,  @"allowsScreenSaverOverMusic",  v48,  v50));

  [v51 setEnabledInStoreDemoMode:1];
  [v4 addObject:v51];
  uint64_t v52 = TSKLocString(@"SaverPreviewTitle");
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v53,  0LL,  0LL,  0LL,  self,  "_showPreview:"));

  [v54 setEnabledInStoreDemoMode:1];
  [v4 addObject:v54];
  -[TSKSettingGroup setSettingItems:](v64, "setSettingItems:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities screenSaverStyleFormatter]( &OBJC_CLASS___TVSettingsUtilities,  "screenSaverStyleFormatter"));
  uint64_t v56 = TSKLocString(@"SaverTransitionTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v55 inputs]);
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[TSKRadioSettingGroup radioGroupWithTitle:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKRadioSettingGroup,  "radioGroupWithTitle:representedObject:keyPath:availableValues:",  v57,  v37,  @"screenSaverStyle",  v58));

  [v59 setEnabledInStoreDemoMode:1];
  [v59 setLocalizedValueFormatter:v55];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000183D4;
  v67[3] = &unk_10018E9B0;
  objc_copyWeak(&v68, &location);
  [v59 setItemUpdateBlock:v67];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1000184C8;
  v65[3] = &unk_10018E608;
  id v60 = v37;
  id v66 = v60;
  [v59 setUpdateBlock:v65];
  v85[0] = v64;
  v85[1] = v59;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 2LL));

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);

  objc_destroyWeak(&location);
  return v61;
}

- (id)_descriptionForToggleViewModel:(id)a3
{
  else {
    uint64_t v3 = @"SaverBackdropSourceDescription";
  }
  uint64_t v4 = TSKLocString(v3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF418 == a6 || off_1001DF420 == a6)
  {
    -[TVSettingsScreenSaverViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverViewController;
    -[TVSettingsScreenSaverViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_playButtonPressed:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 setScreenSaverStyle:v5];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v4 activateScreenSaver];
}

- (void)_selectStyle:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 setScreenSaverStyle:v4];
}

- (void)_selectStyleAndShowTransitionsMenu:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v5 setScreenSaverStyle:v9];

  objc_super v6 = objc_alloc_init(&OBJC_CLASS___TVSettingsScreenSaverTransitionsViewController);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);

  -[TVSettingsScreenSaverTransitionsViewController setTitle:](v6, "setTitle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverViewController navigationController](self, "navigationController"));
  [v8 pushViewController:v6 animated:1];
}

- (void)_showPreview:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance", a3));
  [v3 activateScreenSaver];
}

- (void)_updateStartDelayItem:(id)a3 value:(id)a4
{
  id v17 = a4;
  id v5 = a3;
  if ((uint64_t)[v17 integerValue] <= 0)
  {
    uint64_t v13 = TSKLocString(@"SaverStartDelayNeverTitle");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v14 = TSKLocString(@"SaverDelayNever");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    uint64_t v6 = TSKLocString(@"SaverStartDelayActionTitle");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v9 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter, v8);
    [v9 setUnitsStyle:3];
    [v9 setAllowedUnits:64];
    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponents, v10);
    objc_msgSend(v11, "setMinute:", objc_msgSend(v17, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringFromDateComponents:v11]);
  }

  [v5 setLocalizedTitle:v7];
  [v5 setLocalizedValue:v12];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v16 = [v15 effectiveBoolValueForSetting:@"allowAutomaticScreenSaver"] != 2;

  [v5 setEnabled:v16];
}

@end