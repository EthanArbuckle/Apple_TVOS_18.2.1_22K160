@interface DTTVMainViewController
+ (void)initialize;
- (BOOL)_networkRecordingActive;
- (DTTVMainViewController)initWithStyle:(int64_t)a3;
- (DTTVNLCProfileStore)profileStore;
- (NSUserDefaults)networkRecordingDefaults;
- (id)loadSettingGroups;
- (void)_stopNetworkRecording;
- (void)dealloc;
- (void)nlcError:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setNetworkRecordingDefaults:(id)a3;
- (void)setProfileStore:(id)a3;
- (void)viewDidLoad;
@end

@implementation DTTVMainViewController

+ (void)initialize
{
  if (qword_1E650 != -1) {
    dispatch_once(&qword_1E650, &stru_18700);
  }
}

- (DTTVMainViewController)initWithStyle:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___DTTVMainViewController;
  v3 = -[DTTVMainViewController initWithStyle:](&v22, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___DTTVNLCProfileStore);
    profileStore = v3->_profileStore;
    v3->_profileStore = v4;

    -[DTTVNLCProfileStore loadPreferences](v3->_profileStore, "loadPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v3 selector:"nlcError:" name:@"DTTVNLCProfileStoreErrorNotification" object:0];

    v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.CFNetwork");
    networkRecordingDefaults = v3->_networkRecordingDefaults;
    v3->_networkRecordingDefaults = v7;

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = (id)qword_1E640;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          -[NSUserDefaults addObserver:forKeyPath:options:context:]( v3->_networkRecordingDefaults,  "addObserver:forKeyPath:options:context:",  v3,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13),  1LL,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13));
          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v11);
    }

    id v14 = sub_5CD4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Network Recording Observation Initialized.", v17, 2u);
    }
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = (id)qword_1E640;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_networkRecordingDefaults,  "removeObserver:forKeyPath:context:",  self,  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DTTVMainViewController;
  -[DTTVMainViewController dealloc](&v9, "dealloc");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DTTVMainViewController;
  -[DTTVMainViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"MainDeveloperPanelTitle" value:&stru_18BA0 table:@"Localizable"]);
  -[DTTVMainViewController setTitle:](self, "setTitle:", v5);
}

- (id)loadSettingGroups
{
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[DTTVSettings sharedInstance](&OBJC_CLASS___DTTVSettings, "sharedInstance"));
  v116 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v113 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"NetworkRecordingStopTitle" value:&stru_18BA0 table:@"Localizable"]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  self,  "_stopNetworkRecording"));

  [v6 setDeepLinkKey:@"NetworkRecording"];
  -[NSMutableArray addObject:](v113, "addObject:", v6);
  uint64_t v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"NetworkRecordingGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v9,  v113));

  objc_initWeak(&location, self);
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472LL;
  v120[2] = sub_6E3C;
  v120[3] = &unk_18630;
  v104 = &v121;
  objc_copyWeak(&v121, &location);
  [v112 setUpdateBlock:v120];
  id v10 = sub_5CD4();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Network Recording group created.", (uint8_t *)&buf, 2u);
  }

  -[NSMutableArray addObject:](v116, "addObject:", v112);
  v111 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"UIAutomationEnableTitle" value:&stru_18BA0 table:@"Localizable"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v14,  0LL,  v115,  @"UIAutomationEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v111, "addObject:", v15);
  v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"UIAutomationGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v18,  v111));

  -[NSMutableArray addObject:](v116, "addObject:", v110);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  LODWORD(v17) = [v19 BOOLForKey:@"HangTracer24"];

  if ((_DWORD)v17)
  {
    uint64_t v21 = HTUISettingsTitle(v20);
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = HTUIActivationToggleFooterPart1(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v22,  v24,  v115,  @"hangTracerEnabled",  objc_opt_class(&OBJC_CLASS___DVTTVHangsMainViewController),  &v121);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
    [v26 setLocalizedValueFormatter:v27];

    uint64_t v28 = HTUISettingsGroupTitle();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v125 = v26;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v125, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v29,  v30));

    -[NSMutableArray addObject:](v116, "addObject:", v31);
  }

  else
  {
    v26 = v15;
  }

  v114 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&buf, self);
  v32 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"NLCStatusTitle" value:&stru_18BA0 table:@"Localizable"]);
  profileStore = self->_profileStore;
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_6E8C;
  v117[3] = &unk_18658;
  objc_copyWeak(&v118, &buf);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v34,  0LL,  profileStore,  @"NLCEnabled",  v117));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v36 setLocalizedValueFormatter:v37];

  -[NSMutableArray addObject:](v114, "addObject:", v36);
  v38 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue( [v39 localizedStringForKey:@"SWCDeveloperModeTitle" value:&stru_18BA0 table:@"Localizable"]);
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v40,  0LL,  v115,  @"swcDeveloperModeEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v114, "addObject:", v41);
  v42 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"NLCGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v109 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v44,  v114));

  -[NSMutableArray addObject:](v116, "addObject:", v109);
  v45 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v46 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue( [v47 localizedStringForKey:@"EUVolumeTitle" value:&stru_18BA0 table:@"Localizable"]);
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v48,  0LL,  v115,  @"EUVolumeLimitEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v45, "addObject:", v49);
  v50 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue( [v51 localizedStringForKey:@"PlaybackHUDTitle" value:&stru_18BA0 table:@"Localizable"]);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v52,  0LL,  v115,  @"playbackHUDEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v45, "addObject:", v53);
  v54 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue( [v55 localizedStringForKey:@"ResetMediaServicesTitle" value:&stru_18BA0 table:@"Localizable"]);
  id v57 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v56,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___DTTVResetMediaServicesViewController));
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

  -[NSMutableArray addObject:](v45, "addObject:", v58);
  v59 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue( [v60 localizedStringForKey:@"MediaGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v61,  v45));

  -[NSMutableArray addObject:](v116, "addObject:", v108);
  v62 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v107 = (void *)objc_claimAutoreleasedReturnValue([v63 firstObject]);

  v64 = (void *)objc_claimAutoreleasedReturnValue([v107 stringByAppendingPathComponent:@"PreferenceBundles"]);
  uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 stringByAppendingPathComponent:@"VideoSubscriberAccountDeveloperSettings.bundle"]);
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v60) = [v66 fileExistsAtPath:v65];
  v106 = (void *)v65;

  if ((_DWORD)v60)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v65));
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v67));

    v69 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue( [v70 localizedStringForKey:@"VideoSubscriberAccountGroupTitle" value:&stru_18BA0 table:@"Localizable"]);

    v124 = v68;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v124, 1LL));
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v71,  v72));
    -[NSMutableArray addObject:](v116, "addObject:", v73);
  }

  else
  {
    v68 = v58;
  }

  v74 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v64,  "stringByAppendingPathComponent:",  @"VideoSubscriberAccountTVAppDeveloperSettings.bundle",  v104));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v76 = [v75 fileExistsAtPath:v74];

  if (v76)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v74));
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v77));

    v79 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
    v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue( [v80 localizedStringForKey:@"TVAppGroupTitle" value:&stru_18BA0 table:@"Localizable"]);

    v123 = v78;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v123, 1LL));
    v83 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v81,  v82));
    -[NSMutableArray addObject:](v116, "addObject:", v83);
  }

  else
  {
    v78 = v68;
  }

  v84 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v85 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue( [v86 localizedStringForKey:@"GraphicsHUDTitle" value:&stru_18BA0 table:@"Localizable"]);
  v88 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  v90 = (void *)objc_claimAutoreleasedReturnValue( [v89 localizedStringForKey:@"GraphicsHUDGroupDescription" value:&stru_18BA0 table:@"Localizable"]);
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v87,  v90,  v115,  @"showGraphicsHUD",  0LL,  0LL));

  -[NSMutableArray addObject:](v84, "addObject:", v91);
  v92 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue( [v93 localizedStringForKey:@"GraphicsLogPerformanceTitle" value:&stru_18BA0 table:@"Localizable"]);
  v95 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
  v97 = (void *)objc_claimAutoreleasedReturnValue( [v96 localizedStringForKey:@"GraphicsHUDGroupDescription" value:&stru_18BA0 table:@"Localizable"]);
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v94,  v97,  v115,  @"logGraphicsPerformance",  0LL,  0LL));

  -[NSMutableArray addObject:](v84, "addObject:", v98);
  v99 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue( [v100 localizedStringForKey:@"GraphicsHUDGroupTitle" value:&stru_18BA0 table:@"Localizable"]);
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v101,  v84));

  -[NSMutableArray addObject:](v116, "addObject:", v102);
  objc_destroyWeak(&v118);
  objc_destroyWeak(&buf);

  objc_destroyWeak(v105);
  objc_destroyWeak(&location);

  return v116;
}

- (void)nlcError:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DTTVNLCProfileStoreErrorMessageKey"]);

  id v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"DeveloperSettingsErrorTitle" value:&stru_18BA0 table:@"Localizable"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v14,  1LL));

  objc_super v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DTTVSettings));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"NLCOKActionTitle" value:&stru_18BA0 table:@"Localizable"]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  0LL));

  [v8 addAction:v12];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DTTVMainViewController navigationController](self, "navigationController"));
  [v13 presentViewController:v8 animated:1 completion:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(id)qword_1E640 containsObject:a6])
  {
    -[DTTVMainViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___DTTVMainViewController;
    -[DTTVMainViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (BOOL)_networkRecordingActive
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (id)qword_1E640;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_networkRecordingDefaults,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11));

        if (v8)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)_stopNetworkRecording
{
  id v3 = sub_5CD4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Stopping network recording.", buf, 2u);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = (id)qword_1E648;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSUserDefaults removeObjectForKey:]( self->_networkRecordingDefaults,  "removeObjectForKey:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  (void)v10);
        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }

  CFPreferencesSynchronize(@"com.apple.CFNetwork", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  notify_post("com.apple.CFNetwork.har-capture-update");
}

- (NSUserDefaults)networkRecordingDefaults
{
  return self->_networkRecordingDefaults;
}

- (void)setNetworkRecordingDefaults:(id)a3
{
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